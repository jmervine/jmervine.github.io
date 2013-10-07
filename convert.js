#!/usr/bin/env node
var md2pdf = require('markdown-pdf');
var path = require('path');
var fs = require('fs');

md2pdf(path.resolve(process.cwd(), 'README.md'), function (err, pdfPath) {
    if (err) { return console.trace(err); }
    fs.rename(pdfPath, path.resolve(process.cwd(), 'JoshuaMervine.pdf'), function(err) {
        if (err) { return console.trace(err); }
        console.log('>> '+path.resolve(process.cwd(), 'JoshuaMervine.pdf'));
    });
});

// vim: ft=javascript:
