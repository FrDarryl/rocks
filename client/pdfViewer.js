Template.pdfViewer.rendered = function(){
    PDFJS.workerSrc = '/packages/pascoual_pdfjs/build/pdf.worker.js';
    // Create PDF
    PDFJS.getDocument(url).then(function renderPdfToCanvas(pdf) {
        // Fetch the first page
        pdf.getPage(1).then(function renderPdfToCanvas(page) {
            var scale = 1;
            var viewport = page.getViewport(scale);

            // Prepare canvas using PDF page dimensions
            var canvas = document.getElementById('pdfCanvas');
            var context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            // Render PDF page into canvas context
            page.render({canvasContext: context, viewport: viewport}).promise.then(function () {
                // ?
            });
        });
    });
};
