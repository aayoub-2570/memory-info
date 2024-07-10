import { WebPlugin } from '@capacitor/core';

import type { MemoryInfoPluginPlugin, RAMUsage } from './definitions';

export class MemoryInfoPluginWeb extends WebPlugin implements MemoryInfoPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async getRAMUsage(): Promise<RAMUsage> {
    // Implement a mock or web-specific version
    return {
      totalRAM: 0,
      availableRAM: 0,
      usedRAM: 0,
    };
  }
}
