"""
TypeDB artifacts loading utilities for Bazel workspace
"""

def load_typedb_artifact(name, url, sha256=None, type="jar"):
    """
    Load a TypeDB artifact from a URL.
    
    Args:
        name: The name of the artifact (will be used as the target name)
        url: The URL to download the artifact from
        sha256: Optional SHA256 checksum for verification
        type: The type of artifact ("jar", "tar", "zip", etc.)
    """
    if type == "jar":
        native.http_file(
            name = name,
            url = url,
            sha256 = sha256,
            downloaded_file_path = name + ".jar",
        )
    elif type in ["tar", "tar.gz", "tgz"]:
        native.http_archive(
            name = name,
            url = url,
            sha256 = sha256,
        )
    elif type in ["zip"]:
        native.http_archive(
            name = name,
            url = url,
            sha256 = sha256,
        )
    else:
        # Default to http_file for other types
        native.http_file(
            name = name,
            url = url,
            sha256 = sha256,
        )

def typedb_artifacts():
    """
    Load all TypeDB artifacts.
    This function can be extended to load multiple TypeDB-related artifacts.
    """
    # Example usage - can be uncommented and modified as needed:
    # load_typedb_artifact(
    #     name = "typedb_client_java",
    #     url = "https://repo1.maven.org/maven2/com/vaticle/typedb/typedb-client-java/2.18.0/typedb-client-java-2.18.0.jar",
    #     sha256 = "...",  # Add actual SHA256 when using
    #     type = "jar"
    # )
    pass