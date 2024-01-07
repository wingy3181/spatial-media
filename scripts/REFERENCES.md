- [google/spatial-media - Issue#260 - 2.1 not opening on BigSur 11.1](https://github.com/google/spatial-media/issues/260)
  - Run CLI via python 2.7 using docker
    ```
    # Run a docker container in detached mode with interactive/tty and mount local directory to `/usr/src/app` 
    docker run -dit -v "$(pwd)":/usr/src/app --rm python:2.7.18-stretch
  
    # Run a new command in previously running container to use spatialmedia to examine and print
    # spatial media metadata contained in the file(s) specified.
    #   See https://github.com/google/spatial-media/blob/master/spatialmedia/README.md#examine
    docker exec  -it <container id|name> python /usr/src/app/spatialmedia /usr/src/app/videos/input.mov
    
    # Run a new command in previously running container to use spatialmedia to examine and print
    # spatial media metadata contained in the file(s) specified.
    #   See https://github.com/google/spatial-media/blob/master/spatialmedia/README.md#inject
    docker exec  -it <container id|name> python /usr/src/app/spatialmedia -i /usr/src/app/videos/input.mov /usr/src/app/videos/output.mov    
    ```
  - Run CLI via python3 using local/host machine
    ```
    # See ./scripts/inject-spatial-metadata-using-python-spatialmedia-via-cli.sh
    python3 spatialmedia -i ./videos/input.mov ./videos/output.mov
    ```
- Run CLI via python3 using devcontainer
    ```
    # See ./.devcontainer/devcontainer.json and run this devcontainer
    Within devcontainer terminal, run: `python spatialmedia -i ./videos/input.mov ./videos/output.mo`
    ```
- [google/spatial-media - Issue#261 - UI work for M1 Mac](https://github.com/google/spatial-media/issues/261)
  - [Workaround solution to build Spatial Media Metadata Injector.app](https://github.com/google/spatial-media/issues/261#issuecomment-1590148367)
    - Run GUI via python3 using local/host machine
      ```
      See ./scripts/start-gui-using-python-spatialmedia-via-cli.sh
      ```
    - Build GUI app via python3 + python-tk + pyinstaller using local/host machine
      ```
      See ./scripts/build-gui-spatial-media-metadata-injector-app.sh
      ```
    - (NOT WORKING) Build GUI app via python3 + python-tk + pyinstaller using devcontainer OR docker
      ```
      # Using docker to run pyinstaller for macos
      # - https://stackoverflow.com/questions/73927602/create-pyinstaller-app-on-docker-running-mac
      #   - https://github.com/batonogov/docker-pyinstaller
      #     - https://github.com/sickcodes/Docker-OSX
      # How to install tkinter for python3
      # - https://stackoverflow.com/questions/5459444/tkinter-python-may-not-be-configured-for-tk
      # - https://stackoverflow.com/questions/4783810/install-tkinter-for-python
      #   `sudo apt-get install python-tk python3-tk tk-dev` for linux
      #   `brew install python-tk` for macos
      
      # Attempt to build gui with pyinstaller via docker using batonogov/pyinstaller-osx:v4.0.0 image (but tkinter is not installed)
      #   ```
      #   docker run -v "$(pwd):/src/" batonogov/pyinstaller-osx:v4.0.0 "pyinstaller gui.py --windowed --log-level DEBUG"
      #   ```
      # Error when trying to build gui within docker but tkinter is not installed properly
      # - https://github.com/pyinstaller/pyinstaller/issues/7669
      
      # Alternative attempt to build gui with pyinstaller via docker using batonogov/pyinstaller-osx:v4.0.0 image with specfile instead (but tkinter is not installed)
      #   ```
      #   docker run -v "$(pwd):/src/" -e SPECFILE=./spatial_media_metadata_injector.spec batonogov/pyinstaller-osx:v4.0.0
      #   ```
      
      # Attempt to install python-tk via apt beforehand as per https://github.com/batonogov/docker-pyinstaller?tab=readme-ov-file#how-do-i-install-system-libraries-or-dependencies-that-my-python-packages-need (but apt doesnt exist on osx image of pyinstaller)
      #   ```
      # docker run -v "$(pwd):/src/" --entrypoint /bin/sh batonogov/pyinstaller-osx:v4.0.0 -c "apt update -y && apt install -y python3-tk && /entrypoint.sh" "pyinstaller gui.py --windowed --log-level DEBUG"
      #   ```
      
      # Attempt to install brew + python-tk via brew beforehand as per https://github.com/batonogov/docker-pyinstaller?tab=readme-ov-file#how-do-i-install-system-libraries-or-dependencies-that-my-python-packages-need (but brew fails to install)
      #    ```
      #    docker run --name spatialmedia-builder --rm -v "$(pwd):/src/" --entrypoint /bin/sh batonogov/pyinstaller-osx:v4.0.0 -c "unset POSIXLY_CORRECT && NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh) && brew install python-tk && /entrypoint.sh" "pyinstaller gui.py --windowed --log-level DEBUG"
      #    ```
      ```
