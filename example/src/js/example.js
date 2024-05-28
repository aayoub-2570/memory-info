import { MemoryInfoPlugin } from 'memory-info';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    MemoryInfoPlugin.echo({ value: inputValue })
}
