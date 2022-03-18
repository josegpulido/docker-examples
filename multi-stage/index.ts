
let counter:number = 0;
const max:number = 50;

const interval = setInterval(() => {
    counter++;
    console.log(`Counting ${counter}/${max}`);
    if (counter >= max) {
        clearInterval(interval);
    }
}, 1000);
