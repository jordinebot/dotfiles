# Requires:
# uv tool install --python 3.13 "headroom-ai[all]"
claude() {
    local unwrapped=false
    local pass_args=()
    for arg in "$@"; do
        if [[ "$arg" == "--unwrapped" ]]; then
            unwrapped=true
        else
            pass_args+=("$arg")
        fi
    done
    if $unwrapped; then
        command claude "${pass_args[@]}"
    else
        headroom wrap claude "${pass_args[@]}"
    fi
}
