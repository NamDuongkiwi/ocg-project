<template>
  <section class="banner bgwhite p-t-40 p-b-40">
    <div class="container">
      <div class="row">
        <div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
          <!-- block1 -->
          <div class="block1 hov-img-zoom pos-relative m-b-30" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <img src="@/assets/main.jpg" alt="IMG-BENNER" />

            <div class="block1-wrapbtn w-size2">
              <!-- Button -->
              <router-link to="/products">
                <a class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
                  Gaming gear
                </a>
              </router-link>
            </div>
          </div>

          <!-- block1 -->
          <div class="block1 hov-img-zoom pos-relative m-b-30" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <img src="@/assets/gear.jpg" alt="IMG-BENNER" />

            <div class="block1-wrapbtn w-size2">
              <!-- Button -->
              <router-link to="/products">
                <a class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
                  Gaming gear
                </a>
              </router-link>
              
            </div>
          </div>
        </div>

        <div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
          <!-- block1 -->
          <div class="block1 hov-img-zoom pos-relative m-b-30" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <img src="@/assets/pad.jpg" alt="IMG-BENNER" />

            <div class="block1-wrapbtn w-size2">
              <!-- Button -->
              <router-link to="/products">
                <a class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
                  Gaming gear
                </a>
              </router-link>
            </div>
          </div>

          <!-- block1 -->
          <div class="block1 hov-img-zoom pos-relative m-b-30" style=" box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
            <img src="@/assets/media.jpg" alt="IMG-BENNER"/>

            <div class="block1-wrapbtn w-size2">
              <!-- Button -->
              <router-link to = "/products">
                <a class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4" >
                  Gaming gear
                </a>
              </router-link>  
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "SectionBanner",
};
</script>