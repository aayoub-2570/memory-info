import { registerPlugin } from '@capacitor/core';

import type { MemoryInfoPluginPlugin } from './definitions';

const MemoryInfoPlugin = registerPlugin<MemoryInfoPluginPlugin>('MemoryInfoPlugin', {
  web: () => import('./web').then(m => new m.MemoryInfoPluginWeb()),
});

export * from './definitions';
export { MemoryInfoPlugin };
