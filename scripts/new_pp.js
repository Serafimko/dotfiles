const yargs = require('yargs');
const util = require('util');
const {exec} = require('child_process');


const getPythonPath = version => {
    if (isNaN(Number(version)) && [2, 3].includes(version)) {
        console.log(`Available python versions are: 2 or 3. Not ${version}. Try again.`);
    } else {
        return (version === 2) ? '/usr/bin/python2' : '/usr/bin/python3';
    }
};
const getHomeDir = () => process.env[(process.platform === 'win32') ? 'USERPROFILE' : 'HOME'];

const {argv} = yargs
    .options({
        n: {
            demand: true,
            alias: 'name',
            describe: 'Name for a project',
            string: true
        },
        pv: {
            demand: true,
            alias: 'python-v',
            describe: 'Python version',
            string: true
        },
    })
    .help()
    .alias('h', 'help');

const pythonPath = getPythonPath(argv.pv);
const homeDir = getHomeDir() + '/projects/';
const formattedDirName = homeDir + `${argv.name}`.trim().replace(/\s/gi, '_') + '_env';

exec(`virtualenv -p ${pythonPath} ${formattedDirName} --no-site-packages`, (err, stdout, stderr) => {
    console.log(`Errors:\n${stderr}\n`);
    console.log(`Output:\n${stdout}\n`);
    exec(`cd ${formattedDirName} && git init`, (err, stdout, stderr) => {
        console.log(`${stderr}`);
        console.log(`${stdout}`);
    });
});