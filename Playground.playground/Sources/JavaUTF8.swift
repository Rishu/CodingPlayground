import Foundation

public extension String {
    public func javaUTF8() -> Data? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        let length = self.lengthOfBytes(using: .utf8)
        var buffer = [UInt8]()
        buffer.append(UInt8(0xff & (length >> 8)))
        buffer.append(UInt8(0xff & length))
        var outdata = Data()
        outdata.append(buffer, count: buffer.count)
        outdata.append(data)
        return outdata
    }
}

public extension Dictionary {
    public func javaUTF8() -> Data? {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) {
            let length = data.count
            var buffer = [UInt8]()
            buffer.append(UInt8(0xff & (length >> 8)))
            buffer.append(UInt8(0xff & length))
            var outdata = Data()
            outdata.append(buffer, count: buffer.count)
            outdata.append(data)
            return outdata
        }
        return nil
    }
}

public extension Array {
    public func javaUTF8() -> Data? {
        if let data = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) {
            let length = data.count
            var buffer = [UInt8]()
            buffer.append(UInt8(0xff & (length >> 8)))
            buffer.append(UInt8(0xff & length))
            var outdata = Data()
            outdata.append(buffer, count: buffer.count)
            outdata.append(data)
            return outdata
        }
        return nil
    }
}

public extension Data {
    func javaUTF8() -> Data? {
        if self.count <= 2 {
            return nil
        }
        let range: Range = 2..<self.count
        return self.subdata(in: range)
    }
}


