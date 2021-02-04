
<ul class="users-list ">
    <li style="width: 5%!important">
    <span class="users-list-name" >ID</span>
    </li>
    <li style="width: 20%!important">
    <span class="users-list-name" >Organization Name</span>
    </li>
    <li style="width: 20%!important">
    <span class="users-list-name" >IRS EIN (Taxpayer Id)</span>
    </li>
    <li style="width: 20%!important">
    <span class="users-list-name" >Doing Business As</span>
    </li>
    <li style="width: 25%!important">
    <span class="users-list-name" >Type of business</span>
    </li>
    <li style="width: 10%!important">
    <span class="users-list-name" >Selete</span>
    </li>
    
</ul>
<?php foreach($customers as $user): ?>
    <ul class="users-list clearfix">
        <li style="width: 5%!important">
        <span class="users-list-date"><?php echo $user->id; ?></span>
        </li>
        <li style="width: 20%!important">
        <span class="users-list-date"><?php echo $user->name; ?></span>
        </li>
        <li style="width: 20%!important">
        <span class="users-list-date"><?php echo $user->ein; ?></span>
        </li>
        <li style="width: 20%!important">
        <span class="users-list-date"><?php echo $user->doing_business_as; ?></span>
        </li>
        <li style="width: 25%!important">
        <span class="users-list-date"><?php echo $user->type_of_business; ?></span>
        </li>
           <li style="width: 10%!important">
        <button class="btn btn-primary" onclick="select_customer(<?php echo $user->id; ?>)">More..</button>
        </li>
    </ul>
   
 <?php endforeach; ?>
 