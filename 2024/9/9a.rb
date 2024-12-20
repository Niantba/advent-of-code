require '../inputs/9.rb'

input = "2333133121414131402"

def sort_input(input)
  file_sizes = []
  free_space_sizes = []
  file_id = 0
  i = 0

  while i < input.length
    size = input[i].to_i
    if i.even?
      file_sizes.append << {id: file_id, size: size}
      file_id += 1
    else
      free_space_sizes << size
    end
    i += 1
  end
  return file_sizes, free_space_sizes
end

def disk_representation(file_sizes, free_space_sizes)
  disk = ""
  file_index = 0
  free_space_index = 0

  while file_index < file_sizes.length || free_space_index < free_space_sizes.length
    if file_index < file_sizes.length
      file_sizes[file_index][:size].times do
        disk << file_sizes[file_index][:id].to_s
      end
      file_index += 1
    end

    if free_space_index < free_space_sizes.length
      free_space_sizes[free_space_index].times do
        disk << "."
      end
      free_space_index += 1
    end
  end
  disk
end

def compact_disk(disk)
  moved = false

  last_file_blick_index = -1
  for i in 0..disk.length
    if disk[i] == "."
      for j in i+1..disk.length
        if disk[j] != "."
          disk[i], disk[j] = disk[j], disk[i]
          moved = true
          break
        end
      end
    end
  end
end


file_sizes, free_space_sizes = sort_input(input)
print disk_representation(file_sizes, free_space_sizes)
