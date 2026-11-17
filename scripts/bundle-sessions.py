"""Rebuild deterministic participant ZIPs from the editable session sources."""
from pathlib import Path
from zipfile import ZipFile, ZipInfo, ZIP_DEFLATED

root = Path(__file__).resolve().parents[1]
for session in sorted((root / "sessions").glob("session-*")):
    output = root / "slides" / "download" / (session.name + ".zip")
    output.parent.mkdir(parents=True, exist_ok=True)
    with ZipFile(output, "w", ZIP_DEFLATED) as bundle:
        for path in sorted(session.rglob("*")):
            relative = path.relative_to(session)
            if not path.is_file() or any(part in {"build", "library", ".Rproj.user"} for part in relative.parts):
                continue
            if path.name in {"profile.out", ".Rhistory", ".RData"}:
                continue
            info = ZipInfo(str(Path(session.name) / relative), (2026, 11, 17, 0, 0, 0))
            info.compress_type = ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            bundle.writestr(info, path.read_bytes())
    print(output.relative_to(root))
