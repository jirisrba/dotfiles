function drun
  set image $argv[1]    # name of the image
  set name (basename {$image} | cut -d: -f1)  # short image name
  docker run -it --rm --name $name $image
end
