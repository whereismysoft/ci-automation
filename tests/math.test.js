const { expect } = require("@jest/globals")

function getRandomInt(max) {
    return Math.floor(Math.random() * max)
}

it('Should path if random number greater than 4', () => {
    expect(getRandomInt(8)).toBeGreaterThan(4)
})

it('Should path if random number less than 2', () => {
    expect(getRandomInt(4)).toBeLessThan(2)
})