from PageObjectLibrary import PageObject


class ContactPage(PageObject):
    PAGE_TITLE = "Contact us - My Store"
    PAGE_URL = "/index.php?controller=contact"

    _locators = {
        "email": "id=email",
        "order_reference": "id=id_order",
        "fileUpload": "id=fileUpload",
        "message": "id=message",
        "submit_button": "id=submitMessage",
    }

    def enter_email(self, email):
        """Enter the given string into the email field"""
        self.selib.input_text(self.locator.email, email)

    def enter_message(self, message):
        """Enter the given string into the email field"""
        self.selib.input_text(self.locator.message, message)

    def enter_order_reference(self, order_reference):
        """Enter the given string into the message field"""
        self.selib.input_text(self.locator.order_reference, order_reference)

    def click_the_submit_button(self):
        """Click the submit button, and wait for the page to reload"""
        with self._wait_for_page_refresh():
            self.selib.click_button(self.locator.submit_button)
