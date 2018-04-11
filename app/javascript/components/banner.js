import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["blabla", "zrzr", "fsdf"],
    typeSpeed: 40,
    loop: true,
    showCursor: false,
  });
}
export { loadDynamicBannerText };
