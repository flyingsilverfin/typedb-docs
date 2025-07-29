"""
TypeDB artifacts loading utilities.

This module provides functions to load TypeDB artifacts from URLs.
"""

def load_typedb_artifact(name, url, sha256 = None, strip_prefix = None):
    """
    Load a TypeDB artifact from a URL.
    
    Args:
        name: The name of the artifact target
        url: The URL to download the artifact from
        sha256: Optional SHA256 checksum for verification
        strip_prefix: Optional prefix to strip from the downloaded archive
    """
    native.http_archive(
        name = name,
        url = url,
        sha256 = sha256,
        strip_prefix = strip_prefix,
    )

def typedb_dependencies():
    """
    Load all TypeDB dependencies.
    
    This function can be called from WORKSPACE to load all required
    TypeDB artifacts and dependencies.
    """
    # Example TypeDB artifact loading - update URLs and checksums as needed
    load_typedb_artifact(
        name = "typedb_all",
        url = "https://github.com/vaticle/typedb/releases/download/2.24.0/typedb-all-linux-2.24.0.tar.gz",
        # sha256 = "your_checksum_here",  # Add actual checksum when available
        strip_prefix = "typedb-all-linux-2.24.0",
    )