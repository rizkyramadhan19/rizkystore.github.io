<?php include 'header.php'; ?>

 
<!-- BREADCRUMB -->
<div id="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="index.php">Home</a></li>
		</ul>
	</div>
</div>
<!-- /BREADCRUMB -->

<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">

		<style type="text/css">
			
			@media (max-width: 480px) { 
				.col-xs-6.custom-width{
					/*background: blue !important;*/
					max-width:50% !important;
				}

				.col-xs-6.custom-width img{
					height: 150px !important;
				}

			} 
		</style>

		
		<!-- row -->
		<div class="row">
			
			<?php 
			// include 'sidebar.php'; 
			?>

			<!-- MAIN -->
			<div id="main" class="col-md-12">

				<?php 
				if(isset($_GET['cari'])){
					?>
					Hasil Pencarian : <?php echo htmlspecialchars($_GET['cari']); ?>
					<?php
				}
				?>

				<!-- store top filter -->
				<form action="" method="get">
					<?php 
					if(isset($_GET['cari'])){
						$c = "&cari=".$_GET['cari'];
						?>
						<input type="hidden" name="cari" value="<?php echo $_GET['cari']; ?>">
						<?php
					}else{
						?>
						
						<?php
					}
					?>
					<div class="store-filter clearfix">
						<div class="pull-right">
							<div class="sort-filter">
								<span class="text-uppercase">Urutkan :</span>
								<select class="input" name="urutan" onchange="this.form.submit()">
									<option <?php if(isset($_GET['urutan']) && $_GET['urutan'] == "terbaru"){echo "selected='selected'";} ?> value="terbaru">Terbaru</option>
									<option <?php if(isset($_GET['urutan']) && $_GET['urutan'] == "harga"){echo "selected='selected'";} ?> value="harga">Harga</option>
								</select>
							</div>
						</div>
					</div>
				</form>
				<!-- /store top filter -->

				<!-- STORE -->
				<div id="store">
					<!-- row -->
					<div class="row">

						<?php
						


						$halaman = 12;
						$page = isset($_GET["halaman"]) ? (int)$_GET["halaman"] : 1;
						$mulai = ($page>1) ? ($page * $halaman) - $halaman : 0;
						// $result = mysqli_query($koneksi, "SELECT * FROM produk");

						if(isset($_GET['urutan']) && $_GET['urutan'] == "harga"){
							if(isset($_GET['cari'])){
								$cari = $_GET['cari'];
								$result = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori and produk_nama like '%$cari%' order by produk_harga asc");
							}else{
								$result = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori order by produk_harga asc");
							}
						}else{

							if(isset($_GET['cari'])){
								$cari = $_GET['cari'];
								$result = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori and produk_nama like '%$cari%' order by produk_id desc");
							}else{
								$result = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori order by produk_id desc");
							}

						}    
						
						$total = mysqli_num_rows($result);
						$pages = ceil($total/$halaman);  
						if(isset($_GET['urutan']) && $_GET['urutan'] == "harga"){
							if(isset($_GET['cari'])){
								$cari = $_GET['cari'];
								$data = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori and produk_nama like '%$cari%' order by produk_harga asc LIMIT $mulai, $halaman");
							}else{
								$data = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori order by produk_harga asc LIMIT $mulai, $halaman");
							}
						}else{

							if(isset($_GET['cari'])){
								$cari = $_GET['cari'];
								$data = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori and produk_nama like '%$cari%' order by produk_id desc LIMIT $mulai, $halaman");
							}else{
								$data = mysqli_query($koneksi,"select * from produk,kategori where kategori_id=produk_kategori order by produk_id desc LIMIT $mulai, $halaman");
							}

						}          
						$no =$mulai+1;

						while($d = mysqli_fetch_array($data)){
							?>

							<div class="col-md-3 col-sm-6 col-xs-6">
								<div class="product product-single">
									<div class="product-thumb">
										<div class="product-label">
											<span><?php echo $d['kategori_nama'] ?></span>
										</div>

										<a href="produk_detail.php?id=<?php echo $d['produk_id'] ?>" class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</a>
										
										<?php if($d['produk_foto1'] == ""){ ?>
											<img src="gambar/sistem/produk.png" style="height: 250px">
										<?php }else{ ?>
											<img src="gambar/produk/<?php echo $d['produk_foto1'] ?>" style="height: 250px">
										<?php } ?>
									</div>
									<div class="product-body">
										<h3 class="product-price"><?php echo "Rp. ".number_format($d['produk_harga']).",-"; ?> <?php if($d['produk_jumlah'] == 0){?> <del class="product-old-price">Kosong</del> <?php } ?></h3>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star-o empty"></i>
										</div>
										<h2 class="product-name"><a href="produk_detail.php?id=<?php echo $d['produk_id'] ?>"><?php echo $d['produk_nama']; ?></a></h2>
										<div class="product-btns">
											<a class="main-btn btn-block text-center" href="produk_detail.php?id=<?php echo $d['produk_id'] ?>"><i class="fa fa-search"></i> Lihat</a>
											<a class="primary-btn add-to-cart btn-block text-center" href="keranjang_masukkan.php?id=<?php echo $d['produk_id']; ?>&redirect=index"><i class="fa fa-shopping-cart"></i> Masukkan Keranjang</a>
										</div>
									</div>
								</div>
							</div>
							<!-- /Product Single -->

							<?php 
						}
						?>

					</div>
					<!-- /row -->

					<?php 
					if($total == 0){
						?>
						<center><h4>Belum ada produk.</h4></center>
						<?php
					}
					?>
				</div>
				<!-- /STORE -->

				
				<div class="store-filter clearfix">
					<div class="pull-right">
						<ul class="store-pages">
							<li><span class="text-uppercase">Page:</span></li>
							<?php for ($i=1; $i<=$pages ; $i++){ ?>
								<?php if($page==$i){ ?>
									<li class="active"><?php echo $i; ?></li>
								<?php }else{ ?>

									<?php 
									if(isset($_GET['cari'])){
										$cari = $_GET['cari'];
										$c = "&cari=".$cari;
									}else{
										$c = "";
									}
									if(isset($_GET['urutan']) && $_GET['urutan'] == "harga"){
										?>
										<li><a href="?halaman=<?php echo $i; ?>&urutan=harga<?php echo $c ?>"><?php echo $i; ?></a></li>
										<?php 
									}else{
										?>
										<li><a href="?halaman=<?php echo $i; ?><?php echo $c ?>"><?php echo $i; ?></a></li>
										<?php
									}
									?>

								<?php } ?>
							<?php } ?>
						</ul>
					</div>
				</div>

			</div>
			<!-- /MAIN -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /section -->

<?php include 'footer.php'; ?>