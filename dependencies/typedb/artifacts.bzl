"""
TypeDB artifacts loading utilities for Bazel.

This module provides functions to load TypeDB artifacts from remote URLs.
"""

def load_typedb_artifact(name, url, sha256 = None, strip_prefix = None, type = "zip"):
    """
    Load a TypeDB artifact from a remote URL.
    
    Args:
        name: A unique name for this artifact.
        url: The URL to download the artifact from.
        sha256: Optional SHA256 checksum for verification.
        strip_prefix: Optional prefix to strip from extracted files.
        type: Type of archive (zip, tar.gz, etc.). Defaults to "zip".
    """
    if type == "zip":
        native.http_archive(
            name = name,
            url = url,
            sha256 = sha256,
            strip_prefix = strip_prefix,
        )
    elif type == "tar.gz":
        native.http_archive(
            name = name,
            url = url,
            sha256 = sha256,
            strip_prefix = strip_prefix,
        )
    elif type == "jar":
        native.http_file(
            name = name,
            url = url,
            sha256 = sha256,
            downloaded_file_path = name + ".jar",
        )
    else:
        fail("Unsupported artifact type: {}. Supported types: zip, tar.gz, jar".format(type))

def load_typedb_artifacts():
    """
    Load all standard TypeDB artifacts.
    
    This function can be extended to include standard TypeDB dependencies
    that are commonly used across projects.
    """
    
    # Example TypeDB artifacts - these would be replaced with actual TypeDB URLs
    load_typedb_artifact(
        name = "typedb_client",
        url = "https://repo1.maven.org/maven2/com/vaticle/typedb/typedb-client-java/2.14.1/typedb-client-java-2.14.1.jar",
        sha256 = "example_sha256_hash_here",
        type = "jar"
    )
    
    # Add more standard TypeDB artifacts here as needed