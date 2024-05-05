document.addEventListener('DOMContentLoaded', function() {
    // Get the form element
    var form = document.querySelector('form');

    // Add event listener to intercept keypress events
    form.addEventListener('keypress', function(event) {
        console.log(event.target); // Log the target element
        // Check if the Enter key was pressed and the target element is a textarea
        if (event.key === 'Enter' && event.target.tagName === 'TEXTAREA') {
            // Allow default behavior (typing in textarea)
        } else if (event.key === 'Enter') {
            // Prevent the default form submission behavior
            event.preventDefault();
        }
    });
});
