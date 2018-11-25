module.exports = {
  src: 'spritesmith/src/*', // これらの画像を1個にまとめる。
  destImage: 'spritesmith/dist/sprite.png', // 生成される画像
  destCSS: 'spritesmith/dist/sprite.css', // 生成されるCSS
  algorithm: 'top-down',
  algorithmOpts: { sort: false }
};
