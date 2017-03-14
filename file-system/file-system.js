  //
  //
  // const {  readFileSync } = require ('fs');
  //
  // const fileArg = process.argv[2];
  // if (fileArg) {
  //   try {
  //     const data = readFileSync(fileArg, "");
  //     process.stdout.write(data)
  //   } catch(e){
  //     console.log('error', e.stack);
  //   }
  // } else{
  //   return;
  // }
  //
  // console.log("This is the synchronous version");


  const {
    readFile
  } = require('fs');
  const fileArg = process.argv[2];

  if (fileArg) {
    readFile(fileArg, _, (err, data) => {
      if (err) return console.error(err);
      process.stdout.write(data);
    });
  }
  
  console.log('This is the asynch version');
