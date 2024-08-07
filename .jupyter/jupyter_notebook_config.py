import os
from subprocess import check_call


# -----------------------------------------------------------------------------
# Auto-save .py and .html
# modified from: https://github.com/ipython/ipython/issues/8009
# -----------------------------------------------------------------------------
def post_save(model, os_path, contents_manager):
    """Post-save hook for converting notebooks to .py and .html"""
    if model["type"] != "notebook" or model["name"].startswith("Untitled"):
        return  # only do this for notebooks
    d, fname = os.path.split(os_path)
    check_call(["jupyter", "nbconvert", "--output-dir", "exports/", "--to", "script", fname], cwd=d)
    check_call(["jupyter", "nbconvert", "--output-dir", "exports/", "--to", "html", fname], cwd=d)


c.FileContentsManager.post_save_hook = post_save


# -----------------------------------------------------------------------------
# Strip trailing whitespace
# https://github.com/jupyter/notebook/issues/1455
# -----------------------------------------------------------------------------
def strip_whitespace_pre_save(model=None, **kwargs):
    """Pre-save hook for stripping trailing whitespace."""

    def strip_whitespace(text):
        return "\n".join([line.rstrip() for line in text.split("\n")])

    if model["type"] == "notebook":
        # only run on nbformat v4
        if model["content"]["nbformat"] != 4:
            print("Skipping whitespace stripping since `nbformat` != 4")
            return
        print("Stripping whitespace")
        for cell in model["content"]["cells"]:
            if cell["cell_type"] != "code":
                continue
            cell["source"] = strip_whitespace(cell["source"])
    elif model["type"] == "file":
        if model["format"] == "text":
            print("Stripping whitespace")
            model["content"] = strip_whitespace(model["content"])


c.ContentsManager.pre_save_hook = strip_whitespace_pre_save
