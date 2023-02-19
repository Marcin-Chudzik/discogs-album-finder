# Discogs Album Finder

Program is searching for an albums in the <a href="https://discogs.com">Discogs</a> music assets by using an query which can be artist's name like "Eminem" or album's title "Kamikaze".

## How to run

1. Using a GIT bash write the command.
    ``` bash
    git clone https://github.com/Marcin-Chudzik/discogs-album-finder.git
    ```

2. Install a Ruby gem <a href="https://bundler.io">Bundler</a>. Open a terminal and type.
    ``` bash
    gem install bundler
    ```

3. Install the project requirements. Open a terminal and being in the project directory "\discogs\" type.
    ``` bash
    bundle
    ```

4. Open the "discogs_app.rb" script from a "lib\discogs" directory and in the line 11 type a phrase which will be used to search an album. (In next commit script will be starting from CLI.)
    ``` ruby
    release = client.search "<type here your phrase>"
    ```

5. Now you can run a program typing.
    ``` bash
    ruby .\bin\discogs
    ```