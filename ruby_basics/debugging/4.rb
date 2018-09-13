pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }
# This reassigns the value belonging to the :dog key to the string 'bowser'
# pets[:dog] = 'bowser'
pets[:dog].push('bowser')


p pets
