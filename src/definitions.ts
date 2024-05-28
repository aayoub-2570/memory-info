export interface MemoryInfoPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
