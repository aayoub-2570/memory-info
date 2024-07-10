
export interface RAMUsage {
  totalRAM: number;
  availableRAM: number;
  usedRAM: number;
}

export interface MemoryInfoPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  getRAMUsage(): Promise<RAMUsage>;
}
