<!-- Modal -->
<div class="modal fade" id="ownershipModal" tabindex="-1" aria-labelledby="ownershipModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">

            <!-- Modal header -->
            <div class="modal-header bg-primary text-white">
                <h4 class="modal-title fw-bold" id="ownershipModalLabel">
                    <i class="bi bi-building me-2"></i>Ownership & Boarding House Registration
                </h4>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body p-4">
                <form id="ownershipForm" method="POST" action="${pageContext.request.contextPath}/boarding-house/register" enctype="multipart/form-data">

                    <!-- Progress Indicator -->
                    <div class="row mb-4">
                        <div class="col-12">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 30px; height: 30px;">
                                        <small class="fw-bold">1</small>
                                    </div>
                                    <span class="text-primary fw-semibold">Owner Documents</span>
                                </div>
                                <div class="flex-grow-1 mx-3">
                                    <hr class="my-0">
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center me-2" style="width: 30px; height: 30px;">
                                        <small class="fw-bold">2</small>
                                    </div>
                                    <span class="text-muted">Property Details</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Owner Profile START -->
                    <div class="card border-0 shadow-sm mb-4">
                        <div class="card-header bg-light border-0 py-3">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-person-badge text-primary fs-5 me-2"></i>
                                <h5 class="mb-0 fw-bold text-dark">Owner Documentation</h5>
                            </div>
                            <small class="text-muted mt-1">Upload required legal documents to verify ownership</small>
                        </div>
                        <div class="card-body p-4">
                            <div class="row g-4">
                                <!-- Land Certificate Upload -->
                                <div class="col-lg-6">
                                    <div class="border rounded-3 p-4 h-100 bg-light">
                                        <div class="d-flex align-items-center mb-3">
                                            <i class="bi bi-file-earmark-pdf text-danger fs-4 me-2"></i>
                                            <div>
                                                <label class="form-label fw-semibold mb-1">Land Certificate *</label>
                                                <div class="text-muted small">Upload PDF document</div>
                                            </div>
                                        </div>
                                        <input class="form-control mb-3" type="file" id="landCertificate" name="landCertificate" accept="application/pdf">
                                        <div class="border rounded" id="landCertificatePreviewContainer" style="display: none;">
                                            <iframe id="landCertificatePreview" class="w-100 rounded" style="height: 250px; border: none;"></iframe>
                                        </div>
                                        <div class="text-success small mt-2" id="landCertificateStatus" style="display: none;">
                                            <i class="bi bi-check-circle me-1"></i>Document uploaded successfully
                                        </div>
                                    </div>
                                </div>

                                <!-- Ownership Contract Upload -->
                                <div class="col-lg-6">
                                    <div class="border rounded-3 p-4 h-100 bg-light">
                                        <div class="d-flex align-items-center mb-3">
                                            <i class="bi bi-file-earmark-text text-info fs-4 me-2"></i>
                                            <div>
                                                <label class="form-label fw-semibold mb-1">Ownership Contract *</label>
                                                <div class="text-muted small">Upload PDF document</div>
                                            </div>
                                        </div>
                                        <input class="form-control mb-3" type="file" id="ownershipContract" name="ownershipContract" accept="application/pdf">
                                        <div class="border rounded" id="ownershipContractPreviewContainer" style="display: none;">
                                            <iframe id="ownershipContractPreview" class="w-100 rounded" style="height: 250px; border: none;"></iframe>
                                        </div>
                                        <div class="text-success small mt-2" id="ownershipContractStatus" style="display: none;">
                                            <i class="bi bi-check-circle me-1"></i>Document uploaded successfully
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Owner Profile END -->

                    <!-- Boarding House Info START -->
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-light border-0 py-3">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-house text-success fs-5 me-2"></i>
                                <h5 class="mb-0 fw-bold text-dark">Property Information</h5>
                            </div>
                            <small class="text-muted mt-1">Enter details about your boarding house property</small>
                        </div>
                        <div class="card-body p-4">
                            <div class="row g-4">
                                <!-- House Name -->
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" name="house_name" class="form-control" id="houseName" placeholder="Enter house name" required>
                                        <label for="houseName"><i class="bi bi-house-door me-2"></i>House Name *</label>
                                    </div>
                                </div>

                                <!-- Max Room Count -->
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="number" name="max_room_count" class="form-control" id="maxRoomCount" min="1" value="1" placeholder="Maximum rooms" required>
                                        <label for="maxRoomCount"><i class="bi bi-door-open me-2"></i>Maximum Room Count *</label>
                                    </div>
                                </div>

                                <!-- Address -->
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" name="house_address" class="form-control" id="houseAddress" placeholder="Enter complete address" required>
                                        <label for="houseAddress"><i class="bi bi-geo-alt me-2"></i>Complete Address *</label>
                                    </div>
                                </div>

                                <!-- Description -->
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea name="house_description" class="form-control" id="houseDescription" placeholder="Describe your boarding house..." style="height: 120px;"></textarea>
                                        <label for="houseDescription"><i class="bi bi-card-text me-2"></i>Property Description</label>
                                    </div>
                                    <div class="form-text">
                                        <i class="bi bi-info-circle me-1"></i>
                                        Include amenities, nearby facilities, and any special features
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Boarding House Info END -->

            </div>

            <!-- Modal footer -->
            <div class="modal-footer bg-light border-0 p-4">
                <div class="d-flex justify-content-between w-100">
                    <div class="text-muted small">
                        <i class="bi bi-shield-check me-1"></i>
                        All information is securely encrypted
                    </div>
                    <div>
                        <button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">
                            <i class="bi bi-x-lg me-1"></i>Cancel
                        </button>
                        <button type="submit" form="ownershipForm" class="btn btn-primary" id="submitOwnershipBtn">
                            <i class="bi bi-check-lg me-1"></i>Register Property
                        </button>

                    </div>
                </div>
            </div>
            </form>

        </div>
    </div>
</div>

<script>
    // PDF preview (gi? nguyên ph?n này)
    const MAX_FILE_SIZE_MB = 5;
    const MAX_FILE_SIZE_BYTES = MAX_FILE_SIZE_MB * 1024 * 1024;
    document.getElementById('landCertificate').addEventListener('change', function () {
        const file = this.files[0];
        const preview = document.getElementById('landCertificatePreview');
        const container = document.getElementById('landCertificatePreviewContainer');
        const status = document.getElementById('landCertificateStatus');

        if (file && file.type === 'application/pdf') {
            preview.src = URL.createObjectURL(file);
            container.style.display = 'block';
            status.style.display = 'block';
        } else {
            container.style.display = 'none';
            status.style.display = 'none';
        }
    });

    document.getElementById('ownershipContract').addEventListener('change', function () {
        const file = this.files[0];
        const preview = document.getElementById('ownershipContractPreview');
        const container = document.getElementById('ownershipContractPreviewContainer');
        const status = document.getElementById('ownershipContractStatus');

        if (file && file.type === 'application/pdf') {
            preview.src = URL.createObjectURL(file);
            container.style.display = 'block';
            status.style.display = 'block';
        } else {
            container.style.display = 'none';
            status.style.display = 'none';
        }
    });

    // Form Validation Enhancement (? s?a l?i ?? cho phép submit n?u h?p l?)
    document.getElementById('ownershipForm').addEventListener('submit', function (e) {
        const requiredFields = this.querySelectorAll('[required]');
        let isValid = true;

        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                field.classList.add('is-invalid');
                isValid = false;
            } else {
                field.classList.remove('is-invalid');
                field.classList.add('is-valid');
            }
        });

        // Ki?m tra dung l??ng PDF
        const landCert = document.getElementById('landCertificate').files[0];
        const ownership = document.getElementById('ownershipContract').files[0];

        if (landCert && landCert.size > MAX_FILE_SIZE_BYTES) {
            alert("Land Certificate over 5MB.");
            isValid = false;
        }

        if (ownership && ownership.size > MAX_FILE_SIZE_BYTES) {
            alert("Ownership Contract over 5MB.");
            isValid = false;
        }

        if (!isValid) {
            e.preventDefault();
        } else {
            // ? Ng?n double-submit
            const submitBtn = document.getElementById('submitOwnershipBtn');
            submitBtn.disabled = true;
            submitBtn.innerHTML = `
            <span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>
            Processing...
        `;
        }
    });


    // Real-time validation
    document.querySelectorAll('input[required], textarea[required]').forEach(field => {
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
</script>

