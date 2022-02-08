"use strict";

// Class definition
var KTGiftHandle = function () {
    var form;
    var submitButton;
    var validator;

    var handleForm = function (e) {
        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        validator = FormValidation.formValidation(
            form,
            {
                fields: {
                    'phone': {
                        validators: {
                            notEmpty: {
                                message: 'Số điện thoại không được bỏ trống'
                            },
                        }
                    },
                    'code': {
                        validators: {
                            notEmpty: {
                                message: 'Mã dự thưởng không được bỏ trống'
                            },
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: '.fv-row',
                        eleInvalidClass: '',
                        eleValidClass: ''
                    })
                }
            }
        );
        // Handle form submit
        submitButton.addEventListener('click', function (e) {
            // Prevent button default action
            e.preventDefault();
            // Validate form
            validator.validate().then(function (status) {
                if (status === 'Valid') {
                    // Show loading indication
                    submitButton.setAttribute('data-kt-indicator', 'on');
                    // Disable button to avoid multiple click
                    submitButton.disabled = true;
                    // Simulate ajax request
                    axios.post(submitButton.closest('form').getAttribute('action'), new FormData(form))
                        .then(function (response) {
                            Swal.fire({
                                text: "Chúc mừng bạn đã trúng " + response.data.data.name,
                                icon: "success",
                                buttonsStyling: false,
                                confirmButtonText: "Ok, got it!",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            });
                        })
                        .catch(function (error) {
                            let dataMessage = "";
                            let dataErrors = error.response.data.errors;
                            for (const errorsKey in dataErrors) {
                                if (!dataErrors.hasOwnProperty(errorsKey)) continue;
                                dataMessage += "\r\n" + dataErrors[errorsKey];
                            }
                            if (error.response) {
                                Swal.fire({
                                    text: dataMessage,
                                    icon: "error",
                                    buttonsStyling: false,
                                    confirmButtonText: "Ok, got it!",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                });
                            }
                        })
                        .then(function () {
                            // always executed
                            // Hide loading indication
                            submitButton.removeAttribute('data-kt-indicator');
                            // Enable button
                            submitButton.disabled = false;
                        });
                } else {
                    // Show error popup. For more info check the plugin's official documentation: https://sweetalert2.github.io/
                    Swal.fire({
                        text: "Sorry, looks like there are some errors detected, please try again.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "Ok, got it!",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                }
            });
        });
    }
    return {
        // Initialization
        init: function () {
            form = document.querySelector('#kt_get_gift_form');
            submitButton = document.querySelector('#kt_get_gift_submit');
            handleForm();
        }
    };
}();
// On document ready
KTUtil.onDOMContentLoaded(function () {
    KTGiftHandle.init();
});

