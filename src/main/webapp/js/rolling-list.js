let roller = document.querySelector('section article .rolling-list');
roller.id = 'roller1'; // 아이디 부여

let clone = roller.cloneNode(true)

clone.id = 'roller2';
document.querySelector('section .rolling-wrap').appendChild(clone); 

document.querySelector('#roller1').style.left = '0px';
document.querySelector('#roller2').style.left = document.querySelector('article .rolling-list ul').offsetWidth + 'px';


roller.classList.add('original');
clone.classList.add('clone');
