// script for fixing webstorm support for admin-on-rest package
// accepts -f argument with absolute package.json path as value

const fs = require('fs');

const checkAoRFile = (packageFile) => JSON.parse(packageFile).name === 'admin-on-rest';

const args = process.argv[process.argv.length - 1].split('=');
const filePath = args[0] === '-f' ?
  args[1] :
  `${process.env.HOME}/WebstormProjects/admin-side/node_modules/admin-on-rest/package.json`;

const addDirective = (filePath) => new Promise((resolve, reject) => {
  return fs.readFile(filePath, 'utf8', (err, data) => {
    if (err || !checkAoRFile(data)) {
      reject(err)
    }
    const package = JSON.parse(data);
    package['jsnext:main'] = 'src/index';
    resolve(JSON.stringify(package, undefined, 2))
  });
});

addDirective(filePath).then(res =>
  fs.writeFile(filePath, res, (err) => {
    if (err) {
      throw err;
    }
    return 0
  })
).catch(error => console.log(error));

