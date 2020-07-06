# MacOS update
function update
    #local gisty="gisty pull_all; gisty sync_delete"
    echo mackup backup -f
    mackup backup -f
    echo brew upgrade
    brew update \
      && brew upgrade \
      && brew cleanup
    echo tldr --update
    tldr --update
    echo softwareupdate
    sudo -H softwareupdate -i -a
    # gem update -n /usr/local/bin --system
    pip3 install --upgrade pip setuptools wheel
    pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U
    echo npm update
    npm install npm -g; npm update -g
    echo gem update
    sudo gem update --system -n /usr/local/bin/gem && \
      sudo -H gem update -n /usr/local/bin && \
      sudo -H gem cleanup
end
