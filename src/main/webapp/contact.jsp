<!-- Modal -->
<div class="modal fade" id="contactModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Contact Us</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p class="fs-5 mb-1">Sambit Sinha</p>
				<p class="fs-5 mb-1">Ph: +91 8763458972</p>
				<p class="fs-5 mb-4">Email: sambitsinha81@gmail.com</p>
				<br>
				<p>If you have any queries, please fill the form below</p>
				<div class="alert alert-success" role="alert" id="success-alert"
					style="display: none;">Successfully submitted the message !!
				</div>
				<br>
				<form class="row g-3" id="query-form"
					action="https://docs.google.com/forms/u/0/d/e/1FAIpQLSdIzPjZmmj2Fb7Q2PaeHoaKeF1R9uYO4izBjcHdf10ljiFSxw/formResponse"
					method="post" target="hidden_iframe" onsubmit="submitted=true">
					<div class="col-md-6">
						<label for="first_name" class="form-label">First Name</label> <input
							type="text" class="form-control" id="first_name"
							name="entry.7425069" required>
					</div>
					<div class="col-md-6">
						<label for="last_name" class="form-label">Last Name</label> <input
							type="text" class="form-control" id="last_name"
							name="entry.1616605696" required>
					</div>
					<div class="col-12">
						<label for="emailAddress" class="form-label">Email Address</label>
						<input type="email" class="form-control" id="emailAddress"
							placeholder="" name="entry.4993654" required>
					</div>
					<div class="col-12">
						<label for="queryMessage" class="form-label">Add Message </label>
						<textarea class="form-control" id="queryMessage" rows="3"
							name="entry.1118558279" required></textarea>
					</div>
					<div class="col-12 d-flex align-items-center">
						<button type="submit" id="submit-query" class="btn btn-primary me-3">
							<span id="submit-text">Submit</span>
							<i id="submit-query-loader" class="fa fa-refresh fa-spin ms-2"
							style="display: none;"></i>
						</button>
					</div>
				</form>

				<iframe name="hidden_iframe" id="hidden_iframe"
					style="display: none;"></iframe>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>