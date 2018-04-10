import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["A melhor plataforma para achar a sua baby-sitter rapidamente", "A melhor plataforma para achar a sua baby-sitter facilmente", "A melhor plataforma para achar a sua baby-sitter com confiança"],
    typeSpeed: 40,
    loop: true,
    showCursor: false,
  });
}
export { loadDynamicBannerText };
