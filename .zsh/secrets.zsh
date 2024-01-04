# Path to the secrets file, NOT in git!!!
secrets_file="$HOME/.zsh/secret_values.zsh"


fetch_and_save_secret() {
    local account=$1
    local secret_path=$2
    local var_name=$3

    # Sign in to 1Password and start a session

    # Fetch the item and parse the secret value
    local secret_value=$(op read $secret_path --account=$account)

    # Write the secret to the file
    echo "export $var_name='$secret_value'" >> "$secrets_file"
}

# Check if the secrets file exists
if [[ -f "$secrets_file" ]]; then
    # Source the secrets file if it exists
    source "$secrets_file"
else
    # Empty or create the secrets file
    > "$secrets_file"

    eval $(op signin louwers)
    # Fetch secrets and store them in the secrets file
    # Example usage: fetch_and_save_secret "myaccount.1password.com" "uuid-of-secret-item" "API_KEY"
    fetch_and_save_secret "louwers" "op://Personal/chatgpt.nvim token/credential" "OPENAI_API_KEY"

    # Source the newly created secrets file
    source "$secrets_file"
fi
