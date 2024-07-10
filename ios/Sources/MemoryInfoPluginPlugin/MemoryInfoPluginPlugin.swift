import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(MemoryInfoPluginPlugin)
public class MemoryInfoPluginPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "MemoryInfoPluginPlugin"
    public let jsName = "MemoryInfoPlugin"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = MemoryInfoPlugin()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func getRAMUsage(_ call: CAPPluginCall) {
        let pageSize = vm_kernel_page_size
        var stats = vm_statistics64()
        var count = mach_msg_type_number_t(MemoryLayout<vm_statistics64_data_t>.size / MemoryLayout<integer_t>.size)
        let hostPort = mach_host_self()
        
        let result = withUnsafeMutablePointer(to: &stats) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics64(hostPort, HOST_VM_INFO64, $0, &count)
            }
        }
        
        guard result == KERN_SUCCESS else {
            call.reject("Failed to fetch VM stats")
            return
        }
        
        let totalMemory = ProcessInfo.processInfo.physicalMemory
        let freeMemory = UInt64(stats.free_count) * UInt64(pageSize)
        let usedMemory = totalMemory - freeMemory
        
        let totalRAMGB = Double(totalMemory) / 1_073_741_824.0
        let availableRAMGB = Double(freeMemory) / 1_073_741_824.0
        let usedRAMGB = Double(usedMemory) / 1_073_741_824.0

        call.resolve([
            "totalRAM": String(format: "%.2f", totalRAMGB),
            "availableRAM": String(format: "%.2f", availableRAMGB),
            "usedRAM": String(format: "%.2f", usedRAMGB)
        ])
    }
}
