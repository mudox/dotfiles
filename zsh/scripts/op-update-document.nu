#!/usr/bin/env nu

# Usage:
#   op-update-document.nu <file_path> [title] [vault]
# Example:
#   op-update-document.nu ../.env.local
#   op-update-document.nu ../.env.local "Local Env"
#   op-update-document.nu ../.env.local "Local Env" "Personal"

def main [
    file_path: string
    title?: string
    vault?: string
] {
    let doc_title = if $title == null { $file_path | path basename } else { $title }
    let vault_flag = if $vault == null { [] } else { ['--vault' $vault] }

    print $"Looking for existing document titled: ($doc_title)"

    let items = (op item list --categories DOCUMENT --format json ...$vault_flag | from json)
    let existing = ($items | where title == $doc_title)

    if ($existing | is-empty) {
        print $"No existing document found for title: ($doc_title)"
    } else {
        let id = ($existing | get 0).id
        print $"Deleting existing document with ID: ($id)"
        op item delete $id
    }

    print $"Uploading new document: ($file_path)"
    op document create $file_path --title $doc_title ...$vault_flag --format json | ignore

    print $"Document '($doc_title)' updated successfully."
}

