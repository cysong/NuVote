
export function randomId(prefix) {
    const randomPart = Math.floor(10000 + Math.random() * 90000); // 5 digits
    return `${prefix}${randomPart}`;
}
