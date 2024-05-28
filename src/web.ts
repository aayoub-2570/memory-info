import { WebPlugin } from '@capacitor/core';

import type { MemoryInfoPluginPlugin } from './definitions';

export class MemoryInfoPluginWeb extends WebPlugin implements MemoryInfoPluginPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
