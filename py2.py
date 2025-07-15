tag_block = """    tags = {
      environment = "dev"
      owner       = "saru"
    }
"""

maps_to_tag = ["aks_clusters", "aks_clusters_2"]
max_tags_per_map = 5

input_file = "aks_clusters.tfvars"
output_file = "aks_clusters_with_tags.tfvars"

with open(input_file, "r") as f:
    lines = f.readlines()

new_lines = []
current_map = None
tags_added = {map_name: 0 for map_name in maps_to_tag}
brace_depth = 0

for line in lines:
    stripped = line.strip()

    # Detect map start
    for map_name in maps_to_tag:
        if stripped.startswith(f"{map_name} = {{"):
            current_map = map_name
            brace_depth = 1
            break

    # Track braces to know when map ends
    if current_map:
        brace_depth += line.count("{")
        brace_depth -= line.count("}")
        if brace_depth == 0:
            current_map = None

    new_lines.append(line)

    # Add tags inside the right map, only if identity_type is seen and tags not added
    if (
        current_map in maps_to_tag and
        'identity_type' in stripped and
        tags_added[current_map] < max_tags_per_map
    ):
        new_lines.append(tag_block)
        tags_added[current_map] += 1

with open(output_file, "w") as f:
    f.writelines(new_lines)

print(f"✅ Tags added to clusters under maps: {', '.join(maps_to_tag)}")
print(f"📝 Output saved to {output_file}")
