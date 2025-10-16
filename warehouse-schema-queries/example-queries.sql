-- 1) Recent changes for a given assembly (last 14 days)
SELECT part_id, version, updated_at, material, mass_kg
FROM cad_parts
WHERE assembly = 'gearbox' AND updated_at >= now() - interval '14 days'
ORDER BY updated_at DESC;

-- 2) Parts with suspect geometry (very large bbox) for QA
SELECT part_id, assembly, bbox_x, bbox_y, bbox_z
FROM cad_parts
WHERE bbox_x*bbox_y*bbox_z > 1e6
ORDER BY bbox_x*bbox_y&bbox_z DESC
LIMIT 50;

-- 3) Join back to file provenance
SELECT p.part_id, p.version, f.source_path, f.sha256
FROM cad_parts p
JOIN cad_files f ON p.file_id = f.file_id
WHERE p.material ILIKE '%Steel%' AND p.updated_at > now() - interval '30 days';
