import subprocess
from datetime import datetime
from typing import Optional


def _git_iso_date(path: str) -> Optional[str]:
    try:
        # %cI: committer date, strict ISO 8601
        out = subprocess.check_output([
            "git", "log", "-1", "--format=%cI", path
        ], stderr=subprocess.DEVNULL, text=True).strip()
        # Validate/normalize
        if out:
            # Ensure it's parseable; then return as ISO 8601 (unchanged)
            datetime.fromisoformat(out.replace("Z", "+00:00"))
            return out
    except Exception:
        pass
    return None


def on_page_markdown(markdown, page, config, files):
    # If the page has no explicit date, fill it with last git commit time
    meta = getattr(page, "meta", {}) or {}
    if "date" not in meta:
        src = getattr(page.file, "abs_src_path", None)
        if src:
            iso = _git_iso_date(src)
            if iso:
                # mkdocs-rss-plugin detects 'date' in page.meta
                meta["date"] = iso
                page.meta = meta
    return markdown
