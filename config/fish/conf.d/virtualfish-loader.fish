if test -e $HOME/.local/lib/python3.8/site-packages/virtualfish/virtual.fish
    set -g VIRTUALFISH_VERSION 2.5.0
    set -g VIRTUALFISH_PYTHON_EXEC $HOME/.pyenv/versions/3.8.5/bin/python3
    if test -d $HOME/Developer/python
        set -g PROJECT_HOME $HOME/Developer/python
    else if test -d $HOME/devel/python
        set -g PROJECT_HOME $HOME/devel/python
    end
    if not test -d $HOME/.local/share/virtualenvs
        mkdir -p $HOME/.local/share/virtualenvs
    end
    set -g VIRTUALFISH_HOME $HOME/.local/share/virtualenvs
    source $HOME/.local/lib/python3.8/site-packages/virtualfish/virtual.fish
    source $HOME/.local/lib/python3.8/site-packages/virtualfish/auto_activation.fish
    source $HOME/.local/lib/python3.8/site-packages/virtualfish/environment.fish
    source $HOME/.local/lib/python3.8/site-packages/virtualfish/projects.fish
    source $HOME/.local/lib/python3.8/site-packages/virtualfish/update_python.fish
    emit virtualfish_did_setup_plugins
end
