
import json
import uuid
from pathlib import Path

DATA_DIR = Path("shutoku/data")

seen_ids = set()

for json_file in DATA_DIR.glob("*.json"):

    with open(json_file, "r", encoding="utf-8") as f:
        entries = json.load(f)

    updated = False

    for entry in entries:

        current_id = entry.get("id")

        if (
            current_id is None
            or current_id in seen_ids
        ):

            new_id = str(uuid.uuid4())

            while new_id in seen_ids:
                new_id = str(uuid.uuid4())

            entry["id"] = new_id

            seen_ids.add(new_id)

            updated = True

        else:

            seen_ids.add(current_id)

    if updated:
        print (f"Checking {json_file}")
        with open(json_file, "w", encoding="utf-8") as f:
            json.dump(
                entries,
                f,
                ensure_ascii=False,
                indent=2
            )

        print(f"Updated IDs in {json_file.name}")

print("Done.")
