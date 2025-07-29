"""
TypeDB artifacts loading utilities for Bazel builds.

This file contains utilities for loading TypeDB artifacts from remote URLs.
"""

def load_typedb_artifact(name, url, sha256 = None, executable = False):
    """
    Load a TypeDB artifact from a remote URL.
    
    Args:
        name: The name to give this artifact in the workspace
        url: The URL where the artifact can be downloaded
        sha256: Optional SHA256 checksum for the artifact
        executable: Whether the artifact should be marked as executable
    """
    native.http_file(
        name = name,
        urls = [url] if isinstance(url, str) else url,
        sha256 = sha256,
        executable = executable,
    )

def load_typedb_artifacts():
    """
    Load all standard TypeDB artifacts.
    
    This function loads commonly used TypeDB artifacts from their standard locations.
    Modify this function to add new artifacts as needed.
    """
    # Example TypeDB artifacts - modify these URLs and checksums as needed
    load_typedb_artifact(
        name = "typedb_server",
        url = "https://github.com/vaticle/typedb/releases/download/latest/typedb-server-linux.tar.gz",
        # sha256 = "your_sha256_checksum_here",
    )
    
    load_typedb_artifact(
        name = "typedb_console",
        url = "https://github.com/vaticle/typedb/releases/download/latest/typedb-console-linux.tar.gz",
        # sha256 = "your_sha256_checksum_here",
    )