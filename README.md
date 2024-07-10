# memory-info

The plugin is used to calcute the ram usage

## Install

```bash
npm install memory-info
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`getRAMUsage()`](#getramusage)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### getRAMUsage()

```typescript
getRAMUsage() => Promise<RAMUsage>
```

**Returns:** <code>Promise&lt;<a href="#ramusage">RAMUsage</a>&gt;</code>

--------------------


### Interfaces


#### RAMUsage

| Prop               | Type                |
| ------------------ | ------------------- |
| **`totalRAM`**     | <code>number</code> |
| **`availableRAM`** | <code>number</code> |
| **`usedRAM`**      | <code>number</code> |

</docgen-api>
