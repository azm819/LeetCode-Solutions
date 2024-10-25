class Solution {
    private final class Folder {
        var subfolders: [String: Folder] = [:]
        var terminates: Bool = false
    }

    func removeSubfolders(_ paths: [String]) -> [String] {
        let root = Folder()
        for path in paths {
            var curFolder = root
            var ind = path.index(after: path.startIndex)
            var subpath = ""
            while ind != path.endIndex && !curFolder.terminates {
                if path[ind] == "/" {
                    if let nextFolder = curFolder.subfolders[subpath] {
                        curFolder = nextFolder
                    } else {
                        let newFolder = Folder()
                        curFolder.subfolders[subpath] = newFolder
                        curFolder = newFolder
                    }
                    subpath = ""
                } else {
                    subpath.append(path[ind])
                }

                ind = path.index(after: ind)
            }

            if let nextFolder = curFolder.subfolders[subpath] {
                curFolder = nextFolder
            } else {
                let newFolder = Folder()
                curFolder.subfolders[subpath] = newFolder
                curFolder = newFolder
            }

            curFolder.terminates = true
        }

        var folders: [(path: String, folder: Folder)] = [("", root)]
        var result = [String]()
        while let (path, folder) = folders.popLast() {
            if folder.terminates {
                result.append(path)
            } else {
                folders += folder.subfolders.map { (path + "/" + $0.key, $0.value) }
            }
        }
        return result
    }
}
