select
    *
from {{ ref('data') }}
where diagnosis is not null
