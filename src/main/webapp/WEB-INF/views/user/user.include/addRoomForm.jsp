<div class="modal fade" id="addRoomModal" tabindex="-1" aria-labelledby="addRoomModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <div class="modal-header bg-success text-white">
                <h4 class="modal-title fw-bold" id="addRoomModalLabel">
                    <i class="bi bi-door-open me-2"></i>Add New Room
                </h4>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body p-4">
                <form id="roomForm" method="POST" action="${pageContext.request.contextPath}/api/rooms/form" enctype="multipart/form-data">
                    <input type="hidden" name="house_id" id="modalHouseId" />

                    <!-- Modal header -->

                    <!-- Modal body -->
                    <div class="modal-body p-4">

                        <!-- Progress Indicator -->
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center">
                                        <div class="bg-success text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 30px; height: 30px;">
                                            <small class="fw-bold">1</small>
                                        </div>
                                        <span class="text-success fw-semibold">Basic Info</span>
                                    </div>
                                    <div class="flex-grow-1 mx-3">
                                        <hr class="my-0">
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 30px; height: 30px;">
                                            <small class="fw-bold">2</small>
                                        </div>
                                        <span class="text-muted">Features</span>
                                    </div>
                                    <div class="flex-grow-1 mx-3">
                                        <hr class="my-0">
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 30px; height: 30px;">
                                            <small class="fw-bold">3</small>
                                        </div>
                                        <span class="text-muted">Images</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Basic Room Information START -->
                        <div class="card border-0 shadow-sm mb-4">
                            <div class="card-header bg-light border-0 py-3">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-info-circle text-primary fs-5 me-2"></i>
                                    <h5 class="mb-0 fw-bold text-dark">Basic Room Information</h5>
                                </div>
                                <small class="text-muted mt-1">Enter essential details about the room</small>
                            </div>
                            <div class="card-body p-4">
                                <div class="row g-4">
                                    <!-- Room Title -->
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" name="room_title" class="form-control" id="roomTitle" placeholder="Room Title" required>
                                            <label for="roomTitle"><i class="bi bi-tag me-2"></i>Room Title *</label>
                                        </div>
                                    </div>

                                    <!-- Room Area -->
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="number" step="0.1" max="999.99" name="room_area" class="form-control" id="roomArea" placeholder="Area" required>
                                            <label for="roomArea"><i class="bi bi-arrows-fullscreen me-2"></i>Room Area (m²) *</label>
                                        </div>
                                    </div>

                                    <!-- Price -->
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="number" step="0.01" max="99999999.99" name="room_price" class="form-control" id="roomPrice" placeholder="Price" required>
                                            <label for="roomPrice"><i class="bi bi-currency-dollar me-2"></i>Price (VN?) *</label>
                                        </div>
                                        <div class="form-text">
                                            <i class="bi bi-info-circle me-1"></i>
                                            Monthly rental price
                                        </div>
                                    </div>

                                    <!-- Status -->
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <select class="form-select" name="room_status" id="roomStatus">
                                                <option value="available">Available</option>
                                                <option value="rented">Rented</option>
                                                <option value="maintenance">Maintenance</option>
                                            </select>
                                            <label for="roomStatus"><i class="bi bi-flag me-2"></i>Room Status</label>
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea name="room_description" class="form-control" id="roomDescription" placeholder="Description" style="height: 120px;"></textarea>
                                            <label for="roomDescription"><i class="bi bi-card-text me-2"></i>Room Description</label>
                                        </div>
                                        <div class="form-text">
                                            <i class="bi bi-lightbulb me-1"></i>
                                            Describe the room's features, view, and any special characteristics
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Basic Room Information END -->

                        <!-- Amenities Section START -->
                        <div class="card border-0 shadow-sm mb-4">
                            <div class="card-header bg-light border-0 py-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <div class="d-flex align-items-center">
                                            <i class="bi bi-stars text-warning fs-5 me-2"></i>
                                            <h5 class="mb-0 fw-bold text-dark">Room Amenities</h5>
                                        </div>
                                        <small class="text-muted mt-1">Add amenities and features available in this room</small>
                                    </div>
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="addAmenity()">
                                        <i class="bi bi-plus-lg me-1"></i>Add Amenity
                                    </button>
                                </div>
                            </div>
                            <div class="card-body p-4">
                                <div class="row g-3 amenities-list" id="amenitiesList">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text bg-light">
                                                <i class="bi bi-check2-circle text-success"></i>
                                            </span>
                                            <input type="text" name="amenities" class="form-control" placeholder="e.g., Air Conditioner">
                                            <button class="btn btn-outline-danger btn-sm" type="button" onclick="removeAmenity(this)" style="display: none;">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3 text-muted small">
                                    <i class="bi bi-lightbulb me-1"></i>
                                    <strong>Popular amenities:</strong> Air Conditioner, Wi-Fi, Private Bathroom, Balcony, Wardrobe, Desk & Chair
                                </div>
                            </div>
                        </div>
                        <!-- Amenities Section END -->

                        <!-- Room Images Section START -->
                        <div class="card border-0 shadow-sm">
                            <div class="card-header bg-light border-0 py-3">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-camera text-info fs-5 me-2"></i>
                                    <h5 class="mb-0 fw-bold text-dark">Room Images</h5>
                                </div>
                                <small class="text-muted mt-1">Upload photos to showcase your room</small>
                            </div>
                            <div class="card-body p-4">
                                <!-- Upload Area -->
                                <div class="border-2 border-dashed border-primary rounded-3 p-4 text-center bg-light mb-3">
                                    <i class="bi bi-cloud-upload text-primary fs-1 mb-3"></i>
                                    <h6 class="text-primary mb-2">Upload Room Images</h6>
                                    <p class="text-muted mb-3">Drag and drop images here or click to browse</p>
                                    <input type="file" name="room_images" id="roomImagesInput" class="form-control" multiple accept="image/*">
                                    <div class="form-text mt-2">
                                        <i class="bi bi-info-circle me-1"></i>
                                        Supported formats: JPG, PNG, GIF. Max 5MB per image.
                                    </div>
                                </div>

                                <!-- Image Preview -->
                                <div id="imagePreviewContainer" class="row g-3" style="display: none;">
                                    <div class="col-12">
                                        <h6 class="text-dark fw-semibold mb-3">
                                            <i class="bi bi-images me-2"></i>Preview Images
                                        </h6>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Room Images Section END -->

                    </div>



            </div>

            <!-- Modal footer -->
            <div class="modal-footer bg-light border-0 p-4">
                <div class="d-flex justify-content-between w-100">
                    <div class="text-muted small d-flex align-items-center">
                        <i class="bi bi-shield-check me-1"></i>
                        Room will be available for booking after approval
                    </div>
                    <div>
                        <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">
                            <i class="bi bi-x-lg me-1"></i>Cancel
                        </button>
                        <button type="submit" id="submitRoomBtn" class="btn btn-success">
                            <i class="bi bi-check-lg me-1"></i>Add Room
                        </button>

                    </div>
                </div>
            </div>
            </form>

        </div>
    </div>
</div>



<script>
    // Track selected files
    let selectedFiles = [];

    // Add Amenity Function
    function addAmenity() {
        const list = document.getElementById('amenitiesList');
        const div = document.createElement('div');
        div.classList.add('col-md-6');
        div.innerHTML = `
            <div class="input-group">
                <span class="input-group-text bg-light">
                    <i class="bi bi-check2-circle text-success"></i>
                </span>
                <input type="text" name="amenities" class="form-control" placeholder="e.g., Wi-Fi, Private Bathroom">
                <button class="btn btn-outline-danger btn-sm" type="button" onclick="removeAmenity(this)">
                    <i class="bi bi-trash"></i>
                </button>
            </div>
        `;
        list.appendChild(div);
        updateRemoveButtons();
    }

    // Remove Amenity Function
    function removeAmenity(button) {
        button.closest('.col-md-6').remove();
        updateRemoveButtons();
    }

    // Update Remove Buttons Visibility
    function updateRemoveButtons() {
        const amenityInputs = document.querySelectorAll('#amenitiesList .col-md-6');
        amenityInputs.forEach((item) => {
            const removeBtn = item.querySelector('.btn-outline-danger');
            if (removeBtn) {
                removeBtn.style.display = (amenityInputs.length > 1) ? 'block' : 'none';
            }
        });
    }

    // Image Upload Handler
    const input = document.getElementById('roomImagesInput');
    const previewContainer = document.getElementById('imagePreviewContainer');

    input.addEventListener('change', function () {
        previewContainer.innerHTML = '';

        const files = Array.from(this.files);
        selectedFiles = files;

        if (files.length > 0) {
            previewContainer.style.display = 'flex';
        } else {
            previewContainer.style.display = 'none';
            return;
        }

        files.forEach(file => {
            if (!file.type.startsWith('image/'))
                return;

            const reader = new FileReader();
            reader.onload = function (e) {
                const col = document.createElement('div');
                col.className = 'col-md-3 image-preview-item';

                const img = document.createElement('img');
                img.src = e.target.result;
                img.className = 'img-fluid rounded shadow-sm';
                img.style.maxHeight = '120px';
                img.style.objectFit = 'cover';

                col.appendChild(img);
                previewContainer.appendChild(col);
            };
            reader.readAsDataURL(file);
        });

        // Optional: Show image count
        const countText = document.createElement('p');
        countText.className = 'text-muted small mt-3 w-100';
        countText.innerText = `Total: ${files.length} image(s) selected.`;
        previewContainer.appendChild(countText);
    });

    // Modal Show/Hide
    const addRoomModal = document.getElementById('addRoomModal');
    if (addRoomModal) {
        addRoomModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            if (button) {
                const houseId = button.getAttribute('data-house-id');
                const modalHouseIdInput = document.getElementById('modalHouseId');
                if (modalHouseIdInput && houseId) {
                    modalHouseIdInput.value = houseId;
                }
            }
        });

        addRoomModal.addEventListener('hidden.bs.modal', function () {
            document.getElementById('roomForm').reset();
            selectedFiles = [];
            previewContainer.innerHTML = '';
            previewContainer.style.display = 'none';

            document.querySelectorAll('.is-valid, .is-invalid').forEach(el => {
                el.classList.remove('is-valid', 'is-invalid');
            });
        });
    }

    // Form Validation on Submit
    document.getElementById('roomForm').addEventListener('submit', function (e) {
        const requiredFields = this.querySelectorAll('[required]');
        let isValid = true;

        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                field.classList.add('is-invalid');
                field.classList.remove('is-valid');
                isValid = false;
            } else {
                field.classList.remove('is-invalid');
                field.classList.add('is-valid');
            }
        });

        if (!isValid) {
            e.preventDefault();
            const firstInvalid = this.querySelector('.is-invalid');
            if (firstInvalid) {
                firstInvalid.focus();
            }
        } else {
            // ? Ng?n b?m nhi?u l?n
            const submitBtn = document.getElementById('submitRoomBtn');
            submitBtn.disabled = true;
            submitBtn.innerHTML = `
            <span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>
            Adding...
        `;
        }
    });


    // Real-time validation on blur
    document.querySelectorAll('input[required], textarea[required], select[required]').forEach(field => {
        field.addEventListener('blur', function () {
            if (this.value.trim()) {
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');
            } else {
                this.classList.add('is-invalid');
                this.classList.remove('is-valid');
            }
        });
    });

    // Format price as numeric input
    document.getElementById('roomPrice').addEventListener('input', function () {
        this.value = this.value.replace(/[^\d.]/g, '');
    });

    // On load
    document.addEventListener('DOMContentLoaded', function () {
        updateRemoveButtons();
    });
</script>

