"""
TypeDB artifact loading utilities for Bazel.

This module provides functions to load TypeDB artifacts from remote URLs.
"""

def typedb_artifact(name, url, sha256 = None, strip_prefix = None):
    """
    Loads a TypeDB artifact from a remote URL.
    
    Args:
        name: The name of the artifact target
        url: The URL to download the artifact from
        sha256: Optional SHA256 checksum of the artifact
        strip_prefix: Optional prefix to strip from the downloaded archive
    """
    
    native.http_archive(
        name = name,
        url = url,
        sha256 = sha256,
        strip_prefix = strip_prefix,
    )

def typedb_artifacts():
    """
    Loads all standard TypeDB artifacts.
    
    This function can be extended to load multiple TypeDB artifacts
    with predefined configurations.
    """
    
    # Example TypeDB Core artifact
    # typedb_artifact(
    #     name = "typedb_core",
    #     url = "https://github.com/vaticle/typedb/releases/download/VERSION/typedb-all-linux.tar.gz",
    #     sha256 = "...",
    #     strip_prefix = "typedb-all-linux",
    # )
    
    pass