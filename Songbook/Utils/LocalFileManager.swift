import Foundation

struct LocalFileManager {
    func load<T: Codable>(fromFileNamed fileName: String, in directory: FileManager.SearchPathDirectory = .documentDirectory) -> Result<T, Error> {
        do {
            let fileURL = try fileURL(for: fileName, in: directory)
            let fileData = try Data(contentsOf: fileURL)
            let jsonDecoder = JSONDecoder()
            let model = try jsonDecoder.decode(T.self, from: fileData)
            return .success(model)
        } catch {
            return .failure(error)
        }
    }

    func write<T: Codable>(_ content: T, toFileNamed fileName: String, in directory: FileManager.SearchPathDirectory = .documentDirectory) -> Result<Void, Error> {
        do {
            let fileURL = try fileURL(for: fileName, in: directory)
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(content)
            try data.write(to: fileURL, options: .atomic)
            return .success(())
        } catch {
            return .failure(error)
        }
    }

    private func fileURL(for fileName: String, in directory: FileManager.SearchPathDirectory) throws -> URL {
        let folderURL = try FileManager.default.url(for: directory,
                                in: .userDomainMask,
                                appropriateFor: nil,
                                create: true)
        return folderURL.appendingPathComponent(fileName)
    }
}
