# Create feature branch
git checkout -b feat/cad-normalizer-v2

# Granular commits with messages that explain *why*
git add src/normalize_cad.py
git commit -m "normalize: add SI mass conversion + bbox defaults + file checksums"

# Rebase for linear history before PR
git fetch origin
git rebase origin/main

# Push and open PR
git push -origin feat/cad-normalizer-v2

# After review:
git checkout main && git pull --ff-only
git merge --ff-only feat/cad-normalizer-v2
git push origin main

# Tag a reproducible ingest run
git tag -a v1.2.0 -m "CAD normalizer: unit normalization + checksum"; git push --tags
